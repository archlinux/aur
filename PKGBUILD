pkgname=firefox-extension-radical-native
_name=radical-native
_ext_id='@radical-native'
pkgver=0.1beta14
pkgrel=1
epoch=1
pkgdesc='Extending Riot Web with native capabilities'
arch=('x86_64')
license=('MIT')
depends=("firefox"
         "radical-native-bin")
_repo="stoically/$_name"
url="https://github.com/$_repo"
_rawurl="https://raw.githubusercontent.com/$_repo"
_xpi="radical_native-$pkgver-fx.xpi"
source=("$url/releases/download/v$pkgver/$_xpi"
        "$_rawurl/v$pkgver/LICENSE")
noextract=("$_xpi")

sha512sums=('f9da2a8360d473950956bf4cb0968f567fc353ffb6f882d3bdb14127cdba1e504b5c46427dd019477b5a1671bb148c9a3b0cfabf809c9cf5fea5bf143fe6fda9'
            '4b7ddd854dff49b640b8dad9b8bb7cda64ed02a1aa4f0299498a57fe372e042f4969e2e2bfa2449064e8c9bfb8909d8f4e6644365672a819b61c324302130049')

package() {
    cd "${srcdir}"

    install -Dm644 $_xpi "$pkgdir/usr/lib/firefox/browser/extensions/$_ext_id.xpi"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}