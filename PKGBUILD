# Maintainer: Amin Vakil <info at aminvakil dot com>

pkgname=xssmap
pkgver=r7.1a208b1
pkgrel=1
pkgdesc="Intelligent XSS detection tool that uses human techniques for looking for reflected cross-site scripting (XSS) vulnerabilities "
depends=('phantomjs-bin' 'python' 'python-certifi' 'python-chardet' 'python-idna' 'python-lxml' 'python-requests' 'python-urllib3')
arch=('any')
url="https://github.com/secdec/xssmap"
license=('Apache-2.0')
source=("git+https://github.com/secdec/$pkgname.git")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  bindir="${pkgdir}/usr/bin"
  appdir="${pkgdir}/opt/${pkgname}"

  mkdir -p $appdir $bindir

  chmod 755 $srcdir/$pkgname/XssMap.py
  cp -r $srcdir/$pkgname/* "${appdir}"
  ln -s /opt/$pkgname/XssMap.py "${bindir}"/xssmap
}
