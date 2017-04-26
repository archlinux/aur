# Maintainer: Hans-Nikolai Viessmann <hv15@hw.ac.uk>
# Contributors: SaC Development Team <info@sac-home.org>
pkgname=sac2c
_version=1.2
_changes=467
_name=beta-BlackForest
_commit=gce8d4
pkgver="${_version}BETA${_changes}"
pkgrel=1
pkgdesc='Provides the compiler of the Single-Assignment C programming language.'
arch=('x86_64')
url='http://www.sac-home.org/'
license=('custom:SAC')
depends=('gcc' 'hwloc' 'libutil-linux' 'cuda')
source=("sac2c.rpm::http://www.sac-home.org/packages/RPM/RHEL7/${pkgname}-${_version}-${_name}-${_changes}-${_commit}-omnibus.rpm"
        'LICENSE.txt')
md5sums=('2f469bec80645b6d99c5d53a88788419'
         '84e0ebe0672290c68bf47dbae66287a2')

package() {
	cd "$pkgdir"

    # copy over RPM dir
    cp -r "${srcdir}/usr" .

    # install license file
    mkdir -p "usr/share/licenses/${pkgname}"
    cp "${srcdir}/LICENSE.txt" "usr/share/licenses/${pkgname}"
}
