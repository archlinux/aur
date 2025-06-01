# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=ttf-adwaita-mono-nerd
pkgver=3.4.0
pkgrel=2
pkgdesc="Patched font Adwaita Mono from nerd fonts library"
arch=('any')
url="https://github.com/ryanoasis/nerd-fonts"
license=('OFL-1.1')
provides=('ttf-font-nerd')
source=("AdwaitaMono-$pkgver.tar.xz::$url/releases/download/v$pkgver/AdwaitaMono.tar.xz")
noextract=("AdwaitaMono-$pkgver.tar.xz")
sha256sums=('39b7598b2ec30111d1ace82b274809e5d0930e241683c1c91f5b4c7e64a975cf')

prepare() {
  mkdir -p "AdwaitaMono-$pkgver"
  bsdtar xf "AdwaitaMono-$pkgver.tar.xz" -C "AdwaitaMono-$pkgver"
}

package() {
  cd "AdwaitaMono-$pkgver"
  install -Dm644 *.ttf -t "$pkgdir/usr/share/fonts/TTF/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
