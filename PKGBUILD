# Maintainer: Lunix (David Hess) <davidhess336@gmx.de>
pkgname='dimethoxy-disflux-bin'
pkgver=1.1.1
pkgrel=1
pkgdesc="Transient Smearing Audio Effect for VST3, LV2 and CLAP compatible hosts"
arch=('x86_64')
url="https://github.com/Dimethoxy/Disflux"
license=('GPL3')
provides=('dimethoxy-disflux')
source=("https://github.com/Dimethoxy/Disflux/releases/download/v$pkgver/disflux-v$pkgver-linux-vanilla.zip")
sha256sums=('8e022b4dab7a04c6941b5ebd167ec287a32caec6c41b39be70fe25c5c78db617')

package() {
  # Define new directories
  install -d "$pkgdir/usr/lib/vst3/Dimethoxy/Disflux"
  install -d "$pkgdir/usr/lib/lv2/Dimethoxy/Disflux"
  install -d "$pkgdir/usr/lib/clap/Dimethoxy/Disflux"
  install -d "$pkgdir/usr/share/licenses/$pkgname"

  # Install plugins (use cp -r for directories)
  cp -r "$srcdir/vanilla/Disflux.vst3" "$pkgdir/usr/lib/vst3/Dimethoxy/Disflux/"
  cp -r "$srcdir/vanilla/Disflux.clap" "$pkgdir/usr/lib/clap/Dimethoxy/Disflux/"
  cp -r "$srcdir/vanilla/Disflux.lv2" "$pkgdir/usr/lib/lv2/Dimethoxy/Disflux/"

  # Download and install the LICENSE from the remote URL
  curl -L "https://raw.githubusercontent.com/Dimethoxy/Disflux/refs/heads/main/LICENSE" -o "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
