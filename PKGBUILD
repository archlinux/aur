pkgname=screentorch
pkgdesc="An Instant Replay/ReLive-like program for Linux"
url="https://github.com/sneakysnakeX299/screentorch"
pkgver=1.01
pkgrel=1
source=(
    "git+https://github.com/sneakysnakeX299/screentorch.git"
)
arch=(x86_64 i686 aarch64 ppc ppc64 arm arm64 armv7h armv6h)
license=('GPL')
sha256sums=(
    'SKIP'
)
depends=(
   ffmpeg pulseaudio
)

package() {
    install -Dm755 -d "$pkgdir/$HOME/.config/screentorch/assets/"
    install -Dm755 -d "$pkgdir/usr/bin/"
    install -Dm755 "/usr/bin/ffmpeg" "$pkgdir/$HOME/.config/screentorch/assets/recorder"
    install -Dm755 "${pkgname}/screentorch.py" "$pkgdir/$HOME/.config/screentorch/assets/"
    install -Dm755 "${pkgname}/screentorch" "$pkgdir/usr/bin/"
    chown $USER $pkgdir/$HOME/.config/screentorch/assets
    chown $USER $pkgdir/$HOME/.config/screentorch/
    for file in ${srcdir}/screentorch/assets/*;do
       install -Dm755 "$file" $pkgdir/$HOME/.config/screentorch/assets
       chown $USER $file
    done
}
