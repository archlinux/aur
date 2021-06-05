# Maintainer: The-Repo-Club <The-Repo-Club@github.com>
# Contributor: The-Repo-Club <The-Repo-Club@github.com>
pkgname=instamenu-extra
pkgver=2021.06.05
pkgrel=1
pkgdesc="addons for instamenu"
url="https://github.com/The-Repo-Club/$pkgname"
arch=('any')
groups=('therepoclub')
license=('CC BY-NC-SA 4.0')
depends=('bash' 'systemd' 'glib2' 'autorandr' 'instamenu' 'instamenu-schemas' 'python>=3.4' 'python-gobject')
optdepends=('cutycapt: Taking screenshots with bm command.' 'instaaur: Using the aur with pacman script.' 'ffmpeg: music script depends on this.')
provides=($pkgname)
source=("${pkgname}-$pkgver.tar.gz::${url}/archive/$pkgver.tar.gz")
sha256sums=('6418dc36a4ac9242b59ac281d52cf3acc574b7fd183da3481ad2de42d113b8fb')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
