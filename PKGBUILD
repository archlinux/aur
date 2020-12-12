# Maintainer: Alexander Georgievskiy <galeksandrp@gmail.com>

pkgname=lib32-ffmpeg-steam
pkgver=0.1.0
pkgrel=2
pkgdesc='ln -s /usr/lib32/libav*.so* /home/*/.local/share/Steam/ubuntu12_32/libav*.so* (fix VAAPI memleak for Steam)'
arch=(x86_64)
url='https://freedesktop.org/wiki/Software/vaapi'
license=('MIT')
depends=(lib32-ffmpeg-compat-57 steam)
makedepends=()
optdepends=()
source=('lib32-ffmpeg-steam-libx.path'
        'lib32-ffmpeg-steam-libx.service'
        'lib32-ffmpeg-steam.service')
sha256sums=('5644ed41aed835627a941773ff7480d53332d7a6ed4ca27015f2783996e1ad0e'
            '7128cef1d717ec75c8b2ac39ed84ea87f074d06318a857b2d02cf0d9bd353027'
            '2dfb0a9f6ccce89d796a52223f092df656707aaca52be9962903a343183ecd05')

package() {
  install -D ../lib32-ffmpeg-steam-libx.path "${pkgdir}/usr/lib/systemd/user/lib32-ffmpeg-steam-libx.path"

  install -D ../lib32-ffmpeg-steam-libx.service "${pkgdir}/usr/lib/systemd/user/lib32-ffmpeg-steam-libx.service"

  install -D ../lib32-ffmpeg-steam.service "${pkgdir}/usr/lib/systemd/user/lib32-ffmpeg-steam.service"
}
