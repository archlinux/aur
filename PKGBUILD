# Maintainer: Hans-Nikolai Viessmann <hans AT viess.mn>
# Contributors: SaC Development Team <info AT sac-home.org>

pkgname=sac-stdlib-weekly
_version=1.3
_changes=76
_commit=gfc43
_sac_version="1.3.3-359-2"
pkgver="${_version}.${_changes}"
pkgrel=1
pkgdesc='The standard library for the Single-Assignment C programming language (weekly build)'
arch=('x86_64')
url='http://www.sac-home.org/'
license=('custom:SAC')
depends=("sac-compiler-weekly==1.3.3.359")
provides=('sac-stdlib')
replaces=('sac-stdlib')
conflicts=('sac-stdlib')
source=("http://www.sac-home.org/packages/weekly/Linux/${_sac_version}/full/sac-stdlib-${_version}-${_changes}-${_commit}.tar.gz"
        'LICENSE.txt')
sha256sums=('23893eec2030e6f95cbf906668842e48c17183709b5de8c4164e9235c32700e2'
            'c7d6d43ee20a247fcdce954274f9ffd419bd92644af9ce09929b7bef54a33398')

package() {
	cd "$srcdir/sac-stdlib-${_version}-${_changes}-${_commit}"

    # install libraries
    cp -r usr "$pkgdir/"

    # install license file
    install -Dm644 "${srcdir}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
