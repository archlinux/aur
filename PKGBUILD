# Maintainer: Hans-Nikolai Viessmann <hv15@hw.ac.uk>
# Contributors: SaC Development Team <info@sac-home.org>
pkgname=sac-stdlib
_version=1.3
_changes=2
_commit=g74f8
pkgver="${_version}REV${_changes}"
pkgrel=1
pkgdesc='Provides the standard library of the Single-Assignment C programming language.'
arch=('x86_64')
url='http://www.sac-home.org/'
license=('custom:SAC')
depends=('sac2c=1.2BETA467')
source=("https://github.com/SacBase/Stdlib/releases/download/1.3/${pkgname}-${_version}-${_changes}-${_commit}-RHEL7.rpm"
        'LICENSE.txt')
md5sums=('22c3bb3023e30a8c8550d78fb515ed15'
         '84e0ebe0672290c68bf47dbae66287a2')

package() {
	cd "$pkgdir"

    # copy over RPM dir
    cp -r "${srcdir}/usr" .

    # install license file
    mkdir -p "usr/share/licenses/${pkgname}"
    cp "${srcdir}/LICENSE.txt" "usr/share/licenses/${pkgname}"
}
