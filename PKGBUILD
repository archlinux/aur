# Maintainer: Juliette Monsel <j_4321 at protonmail dot com>
pkgname=python-tkfilebrowser
pkgver=1.1.0
pkgrel=2
pkgdesc="File browser for Tkinter, alternative to tkinter.filedialog in linux with GTK bookmarks support."
url="https://github.com/j4321/tkFileBrowser"
arch=('any')
license=('GPL3')
makedepends=('python-setuptools')
depends=('python-psutil' 'tk')
source=("tkFileBrowser-$pkgver.tar.gz::https://github.com/j4321/tkFileBrowser/releases/download/v$pkgver/tkFileBrowser-$pkgver.tar.gz")
sha512sums=('f8f7195c3348fec9c50d7443d260e7388dd53927f9650f4dea0c6645cce6361fb030fb1cbd3b0040791c837006e55780b778bde27cdf70816eaa201c770bcaa2')
package() {
 cd "$srcdir/tkFileBrowser-$pkgver"
 python3 setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1;
 install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
