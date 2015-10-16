# PLEASE NOTICE, IT DOES NOT WORK AT THE MOMENT, patches sent to upstream, waiting for a new version:
# http://testcams.com/blog/forums/topic/linux-fix/

_name=airnef
pkgbase=python-airnef
pkgname=("python-airnef" "python2-airnef")
pkgver=1.1
pkgrel=1
pkgdesc="Wireless download from your Nikon/Sony/Canon camera"
arch=('any')
url="http://www.testcams.com/airnef/"
license=('GPL3')
depends=('tk')
makedepends=('python-setuptools' 'python2-setuptools')
source=("http://www.testcams.com/airnef/Version_1.1/airnef_v1.1_Source.zip")
sha512sums=('b45b0591e42179d1e5b5eea9ede6762d311cd0642585c54568c90111424e2ca316aa444d772b4855afe42f25b6cc4b3e1b78bb5a0c2a4cb52440535894a5cba6')

package_python-airnef() {
    pkgdesc+=" (for Python 3.x)"
    PYTHONVER=`python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))'`
    install -d ${pkgdir}/usr/lib/python$PYTHONVER/site-packages/$_name/appresource
    install ${srcdir}/$_name/*.py ${pkgdir}/usr/lib/python$PYTHONVER/site-packages/$_name/
    install ${srcdir}/$_name/*.pyw ${pkgdir}/usr/lib/python$PYTHONVER/site-packages/$_name/
    install ${srcdir}/$_name/appresource/* ${pkgdir}/usr/lib/python$PYTHONVER/site-packages/$_name/appresource/
    install -d ${pkgdir}/usr/bin
    ln -s /usr/lib/python$PYTHONVER/site-packages/$_name/airnef.pyw ${pkgdir}/usr/bin/airnef
    ln -s /usr/lib/python$PYTHONVER/site-packages/$_name/airnefcmd.py ${pkgdir}/usr/bin/airnefcmd
}

package_python2-airnef() {
  pkgdesc+=" (for Python 2.x)"
  PYTHONVER=`python2 -c 'import sys; print(".".join(map(str, sys.version_info[:2])))'`
  install -d ${pkgdir}/usr/lib/python$PYTHONVER/site-packages/$_name/appresource
  install ${srcdir}/$_name/*.py ${pkgdir}/usr/lib/python$PYTHONVER/site-packages/$_name/
  install ${srcdir}/$_name/*.pyw ${pkgdir}/usr/lib/python$PYTHONVER/site-packages/$_name/
  install ${srcdir}/$_name/appresource/* ${pkgdir}/usr/lib/python$PYTHONVER/site-packages/$_name/appresource/
  install -d ${pkgdir}/usr/bin
  ln -s /usr/lib/python$PYTHONVER/site-packages/$_name/airnef.pyw ${pkgdir}/usr/bin/airnef
  ln -s /usr/lib/python$PYTHONVER/site-packages/$_name/airnefcmd.py ${pkgdir}/usr/bin/airnefcmd
}
