# Maintainer: Iván Gabaldón <contact|@|inetol.net>

pkgname=statping-ng-bin
_pkgname=statping-ng
pkgver=0.90.80
pkgrel=3
pkgdesc='Web and app status monitoring for any type of project (binary release)'
arch=('x86_64' 'i686' 'aarch64' 'armv7h' 'armv6h')
url='https://github.com/statping-ng/statping-ng'
license=('GPL3')
optdepends=('dart-sass: Support custom styling')
conflicts=("$_pkgname" 'statping')
install="$pkgname.install"
source=("LICENSE::https://raw.githubusercontent.com/$_pkgname/$_pkgname/v$pkgver/LICENSE"
        'statping-daemon.service')
source_x86_64=("$_pkgname-$pkgver-x86_64.tar.gz::https://github.com/$_pkgname/$_pkgname/releases/download/v$pkgver/statping-linux-amd64.tar.gz")
source_i686=("$_pkgname-$pkgver-i686.tar.gz::https://github.com/$_pkgname/$_pkgname/releases/download/v$pkgver/statping-linux-386.tar.gz")
source_aarch64=("$_pkgname-$pkgver-aarch64.tar.gz::https://github.com/$_pkgname/$_pkgname/releases/download/v$pkgver/statping-linux-arm64.tar.gz")
source_armv7h=("$_pkgname-$pkgver-armv7h.tar.gz::https://github.com/$_pkgname/$_pkgname/releases/download/v$pkgver/statping-linux-arm-7.tar.gz")
source_armv6h=("$_pkgname-$pkgver-armv6h.tar.gz::https://github.com/$_pkgname/$_pkgname/releases/download/v$pkgver/statping-linux-arm-6.tar.gz")
b2sums=('e93f7991437ebcd5ebfae1650ff4f079d7d8a5d2a3ea199ad929032702fb4a5b4cf27d47e25850c565661e1b2f8b445b4cf51fbd8f2a52259578c22e620373cb'
        '0b9541191599b38bcf8edd4ba54e7a405c32ec335e8c5ce41ac29efe231c8ba3c0d7786e0bc74c98713de0f83ebfe217cd19c92cdb62d9b019852505b1f7c4ba')
b2sums_x86_64=('139f4a43e91389cee00281d91c5a7ce96db7270bef472e60f3c5e146d7b1d0e459c776d0ef318c828581acbbb76b4bab3a38115259a779e5ad4634be27564043')
b2sums_i686=('543d7336790626ad78dd18b9d75c0701db1b380969201220630edae4463794bc8ec131cb8757fade3f290f7c873727a604b47c76d83a371ea78a6cc14d1938be')
b2sums_aarch64=('af2cf20a979221b670baea1c5df5b6d5eb87aee71793abd42bff5ee3b28849d6a77aaad0e68e5b9de41a84407d634d48018259e61f0bea34edceb0effbcb6448')
b2sums_armv7h=('e4a393bcb96094abfae06537a207dc483bd828a19a8cbf67f2a51e4177d21c6e3bda76d08956b0627494e85679a55e41b97ec942ea08f0f20cf89ff6586e9a31')
b2sums_armv6h=('95040412b270f2db7bda42d611fb7e6a7118d0c5d74d53d4d5067cd5021f3c641e4f111b39b22fa2fc5322cb2c14c9dec9304fbc6485618a392d770bb6ad2e37')

package() {
    install -d "$pkgdir/etc/statping"

    install -Dm755 "$srcdir/statping" "$pkgdir/usr/bin/statping"
    install -Dm644 "$srcdir/statping-daemon.service" "$pkgdir/usr/lib/systemd/system/statping-daemon.service"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
