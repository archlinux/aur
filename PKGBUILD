# Maintainer: Ossian Mapes <self@ossian.dev>

_pkgname=lutgen-studio
pkgname=$_pkgname-bin
pkgver=0.1.1
pkgrel=1
pkgdesc="Offical GUI for Lutgen, the best way to apply popular colorschemes to any image or wallpaper!"
url="https://github.com/ozwaldorf/lutgen-rs"
license=("MIT")
arch=("x86_64")
provides=("lutgen-studio")
conflicts=("lutgen-studio")
source=("LICENSE" "https://github.com/ozwaldorf/lutgen-rs/releases/download/$_pkgname-v$pkgver/$_pkgname-v$pkgver-x86_64-unknown-linux-gnu")
sha256sums=('f007afaeba32931337b4be155b3f8094cce9248dece43ebe53bf2579fe26a330'
            '4183b919c8387bb90e219c34b36b13fdf6208a5847ce938151b24e98589b1ca6')
depends=(
  'libxkbcommon'
  'libxcb'
  'wayland'
  'openssl'
  'zenity' # file picker
)

package() {
    mv $_pkgname-v$pkgver-x86_64-unknown-linux-gnu $_pkgname
    install -Dm755 $_pkgname -t "$pkgdir/usr/bin"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}


