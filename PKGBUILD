# Maintainer: Hans-Nikolai Viessmann <hv15@hw.ac.uk>
# Contributors: SaC Development Team <info@sac-home.org>
pkgname=sac2c
_version=1.2
_changes=367
_name=beta-blackforest
_commit=gfb6f0
pkgver="${_version}BETA${_changes}"
pkgrel=1
pkgdesc='Provides the compiler of the Single-Assignment C programming language.'
arch=('x86_64')
url='http://www.sac-home.org/'
license=('custom:SAC')
depends=('gcc' 'hwloc')
source=("sac2c.rpm::http://www.sac-home.org/lib/exe/fetch.php?media=download:${pkgname}:v${_version}:${pkgname}-${_version}-${_name}-${_changes}-${_commit}-omnibus.rpm"
        'LICENSE.txt')
md5sums=('a06cdf9b083caf4d92a7fdb712b354ac'
         '7959e1a802cfaa1b6fde1d5e73eeef86')

package() {
	cd "$pkgdir"

    # copy over RPM dir
    cp -r "${srcdir}/usr" .

    # install license file
    mkdir -p "usr/share/licenses/${pkgname}"
    cp "${srcdir}/LICENSE.txt" "usr/share/licenses/${pkgname}"
}
