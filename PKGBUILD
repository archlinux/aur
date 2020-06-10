pkgname=firefox-extension-radical-native
_name=radical-native
_ext_id='@radical-native'
pkgver=0.1.0beta13
_xpiver=0.1beta13
pkgrel=1
pkgdesc='Extending Riot Web with native capabilities'
arch=('x86_64')
license=('MIT')
depends=("firefox"
         "radical-native-bin")
_repo="stoically/$_name"
url="https://github.com/$_repo"
_rawurl="https://raw.githubusercontent.com/$_repo"
_xpi="radical_native-$_xpiver-fx.xpi"
source=("$url/releases/download/v$pkgver/$_xpi"
        "$_rawurl/v$pkgver/LICENSE")
noextract=("$_xpi")

sha512sums=('868bc573a41ebe6afda15940fae2c84963b5afe947d85bce4b6d6a570da467ecbdd2b3987e9fcc2ee1c6ef95d4b71d7612b4810b37bc00ad69943c8622766d92'
            '4b7ddd854dff49b640b8dad9b8bb7cda64ed02a1aa4f0299498a57fe372e042f4969e2e2bfa2449064e8c9bfb8909d8f4e6644365672a819b61c324302130049')

package() {
    cd "${srcdir}"

    install -Dm644 $_xpi "$pkgdir/usr/lib/firefox/browser/extensions/$_ext_id.xpi"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}