# Maintainer: Blackleg <blackleg@openaliasbox.org>

pkgname=netbeans-python
pkgver=8.0.2
pkgrel=1
pkgdesc="NetBeans Python plugin"
arch=('any')
url="http://http://nbpython.org/"
license=("GNU LGPL V2.1" "CDDL v1.0")
depends=('netbeans=8.0.2')
makedepends=("unpacknbm")
_plugin=("3380")
source=(http://plugins.netbeans.org/download/plugin/${_plugin})
md5sums=('96739d59a1b8e200cb448de38945b1a8')

package() {
	INSTALLDIR=${pkgdir}/usr/share/netbeans/python
	mkdir -p ${INSTALLDIR}
	unpacknbm --install ${INSTALLDIR}   org-netbeans-modules-python-core.nbm
	unpacknbm --install ${INSTALLDIR}   org-netbeans-modules-python-console.nbm
	unpacknbm --install ${INSTALLDIR}   org-netbeans-modules-python-debugger.nbm
	unpacknbm --install ${INSTALLDIR}   org-netbeans-modules-python-editor.nbm
	unpacknbm --install ${INSTALLDIR}   org-netbeans-modules-python-help.nbm
	unpacknbm --install ${INSTALLDIR}   org-netbeans-modules-python-options.nbm
	unpacknbm --install ${INSTALLDIR}   org-netbeans-modules-python-platform.nbm
	unpacknbm --install ${INSTALLDIR}   org-netbeans-modules-python-project.nbm
	unpacknbm --install ${INSTALLDIR}   org-netbeans-modules-python-samples.nbm
	unpacknbm --install ${INSTALLDIR}   org-netbeans-modules-python-testrunner.nbm

	#Fix Jython issue
	cd ${INSTALLDIR}/modules/ext
	ln -s jython-2.jar jython-2.5.1.jar
}
