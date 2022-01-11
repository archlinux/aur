# Maintainer: Hans-Nikolai Viessmann <hans AT viess DOT mn>
# Contributors: SaC Development Team <info AT sac-home DOT org>

pkgname=sac-stdlib-weekly-basic
_version=1.3
_changes=137
_commit=g1cad5
_sac_version="1.3.3-705-1"
pkgver="${_version}.${_changes}"
pkgrel=1
pkgdesc='The standard library for the Single-Assignment C programming language (weekly build)'
arch=('x86_64')
url='https://www.sac-home.org/'
license=('custom:SAC')
depends=('sac-compiler-weekly-basic>=1.3.3.705' 'glibc')
provides=('sac-stdlib')
replaces=('sac-stdlib')
conflicts=('sac-stdlib' 'sac-stdlib-weekly')
source=("https://gitlab.sac-home.org/sac-group/sac-packages/-/raw/master/packages/weekly/Linux/${_sac_version}/basic/sac-stdlib-${_version}-${_changes}-${_commit}.tar.gz"
        'LICENSE.txt')
sha256sums=('ecbe18742f95b9d90430c16a056cae177b5a193258d8f16880c10c201193cd50'
            '01938a80d588cf44e2c8ef644c0bdd833ce5a6abc1becbe5a32a2448524e44fe')

package() {
	cd "$srcdir/sac-stdlib-${_version}-${_changes}-${_commit}"

    # install libraries
    cp -r usr "$pkgdir/"

    # install license file
    install -Dm644 "${srcdir}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
