# Maintainer: Hans-Nikolai Viessmann <hans AT viess.mn>
# Contributors: SaC Development Team <info AT sac-home.org>

pkgname=sac-stdlib-weekly
_version=1.3
_changes=66
_commit=g58e8
_sac_version="1.3.3-352"
pkgver="${_version}.${_changes}"
pkgrel=1
pkgdesc='The standard library for the Single-Assignment C programming language (weekly build)'
arch=('x86_64')
url='http://www.sac-home.org/'
license=('custom:SAC')
depends=("sac-compiler-weekly==1.3.3.352")
provides=('sac-stdlib')
replaces=('sac-stdlib')
conflicts=('sac-stdlib')
source=("http://www.sac-home.org/packages/weekly/Linux/${_sac_version}/sac-stdlib-${_version}-${_changes}-${_commit}.tar.gz"
        'LICENSE.txt')
sha256sums=('eda7d378723018f7276bc9b6c598761a961ba2647cc5b61cb3bd8e8f067cce04'
            'c7d6d43ee20a247fcdce954274f9ffd419bd92644af9ce09929b7bef54a33398')

package() {
	cd "$srcdir/sac-stdlib-${_version}-${_changes}-${_commit}"

    # install libraries
    cp -r usr "$pkgdir/"

    # install license file
    install -Dm644 "${srcdir}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
