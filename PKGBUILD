pkgname=luna-cli
pkgver=0.1.1
pkgrel=1
pkgdesc="Your Personal AI Coding Assistant & Friend right in your Terminal."
arch=('any')
url="https://github.com/Arunachalam-gojosaturo/Luna-cli"
license=('MIT')
depends=('nodejs' 'npm')
source=("https://registry.npmjs.org/@arunachalamarc017/${pkgname}/-/${pkgname}-${pkgver}.tgz")
sha256sums=('2ad1b6947a358e22f406f8c73b77cf67c63243609bc64e37a14dff0c1d3512c1')

package() {
  npm install -g --cache "${srcdir}/npm-cache" --prefix "${pkgdir}/usr" "${srcdir}/@arunachalamarc017/${pkgname}-${pkgver}.tgz"
  
  # Remove extra npm clutter
  rm -rf "${pkgdir}/usr/etc"
  rm -rf "${pkgdir}/usr/lib/node_modules/@arunachalamarc017/luna-cli/node_modules/puppeteer/.local-chromium" 2>/dev/null || true
}
