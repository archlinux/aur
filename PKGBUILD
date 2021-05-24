# Maintainer: Hans-Nikolai Viessmann <hans AT viess.mn>
# Contributors: SaC Development Team <info AT sac-home.org>

pkgname=sac-stdlib-weekly
_version=1.3
_changes=115
_commit=g540a
_sac_version="1.3.3-659-1"
pkgver="${_version}.${_changes}"
pkgrel=2
pkgdesc='The standard library for the Single-Assignment C programming language (weekly build)'
arch=('x86_64')
url='http://www.sac-home.org/'
license=('custom:SAC')
depends=('sac-compiler-weekly>=1.3.3.659' hwloc cuda)
provides=('sac-stdlib')
replaces=('sac-stdlib')
conflicts=('sac-stdlib' 'sac-stdlib-weekly-basic')
source=("https://gitlab.sac-home.org/sac-group/sac-packages/-/raw/master/packages/weekly/Linux/${_sac_version}/full/sac-stdlib-${_version}-${_changes}-${_commit}.tar.gz"
        'LICENSE.txt')
sha256sums=('5fc51980584813769df2515f2451c6e978e56c8a7b1d438cdfc890fa5725a0eb'
            'cb641cc7eb118bbf08dadffc35c57eb7a1ab4d542c3e73c79f5c4f7c1560bf22')

package() {
	cd "$srcdir/sac-stdlib-${_version}-${_changes}-${_commit}"

    # install libraries
    cp -r usr "$pkgdir/"

    # install license file
    install -Dm644 "${srcdir}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
