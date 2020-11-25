# Contributor: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>
# Contributor: Jan Oliver Oelerich <janoliver@oelerich.org>

pkgname=inkslides-git
pkgdesc='Generate a PDF presentation out of an inkscape SVG document'
pkgver=r41.f0b15c8
pkgrel=1
arch=('i686' 'x86_64')
license=('MIT')
depends=('python' 'inkscape' 'python-lxml')
makedepends=('git')
url='https://github.com/janoliver/inkslides'
source=('git+https://github.com/janoliver/inkslides.git')
_gitname="inkslides"
md5sums=('SKIP')

pkgver() {
  cd "$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$_gitname"
  python setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1

  install -D -m644 MIT-LICENSE "$pkgdir/usr/share/licenses/$pkgname/MIT-LICENSE"
}
