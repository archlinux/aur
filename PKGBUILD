# Maintainer: Shibam Roy <royshibam9826@gmail.com>
pkgname=easyfeh-git
pkgver=beta3.3.g13c6b77
pkgrel=1
pkgdesc="An easy, and user-friendly feh wrapper (Git version)"
arch=('any')               
conflicts=('easyfeh')
url="https://github.com/ShibamRoy9826/easyfeh"
license=('MIT')           
depends=('feh' 'python' 'python-toml' 'python-requests' 'python-beautifulsoup4' 'python-rich' )       
optdepends=(
  'swww: Enables wayland support'
  'python-colorthief: Enables the feature to extract colors from current wallpaper'
'python-pillow: Enables wallpaper effects feature'
  )
makedepends=('git' 'python' 'python-setuptools')
source=("git+https://github.com/ShibamRoy9826/easyfeh.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/easyfeh"
    git describe --long --tags | sed 's/^v//;s/-/./g'
}
package() {
    cd "$srcdir/easyfeh"
    python setup.py install --root="$pkgdir/" --optimize=1
}
