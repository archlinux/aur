# Maintainer: ItzSelenux <itszariep@outlook.com>

pkgname="ghostlexly-gpu-video-wallpaper-git"
_reponame='gpu-video-wallpaper'
pkgver=2023.06.24.1cb6623
pkgrel=1
arch=("any")
pkgdesc="User your GPU for rendering low cpu using/usage video animated wallpaper"
url="https://github.com/ghostlexly/${_reponame}"
license=("MIT")
depends=('python-pyqt5' 'mpv' 'xorg-xrandr' 'xwinwrap')
makedepends=("git")
source=("git+$url.git")
sha256sums=('SKIP')

package()
{
cd gpu-video-wallpaper
install -Dm755 "gui.ui" -t "$pkgdir/usr/bin/"
install -Dm755 "video-wallpaper.py" -t "$pkgdir/usr/bin/"
install -Dm755 "gui.ui" -t "$pkgdir/usr/bin/"
sed -i 's/%WID/WID/g' video-wallpaper.sh
install -Dm755 "video-wallpaper.sh" -t "$pkgdir/usr/bin/"
}
