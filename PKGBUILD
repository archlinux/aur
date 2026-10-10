# Maintainer: Sebastian Korotkiewicz <skorotkiewicz@gmail.com>
pkgname=rhun-bin
pkgver=0.17.9
pkgrel=1
pkgdesc='Small and fast code editor written in assembly (prebuilt binaries)'
arch=('x86_64')
url='https://github.com/vshvedov/rhun'
license=('MIT' 'OFL-1.1')
options=(!strip)
optdepends=('git: integrated Git features'
            'xdg-utils: open links and reveal files'
            'curl: update checks and local AI model downloads')
provides=('rhun')
conflicts=('rhun')

source=("LICENSE-Iosevka-$pkgver.md::https://raw.githubusercontent.com/vshvedov/rhun/v$pkgver/assets/fonts/LICENSE-Iosevka.md")
source_x86_64=("rhun-$pkgver-linux-x86_64.tar.gz::$url/releases/download/v$pkgver/rhun-$pkgver-linux-x86_64.tar.gz")
sha256sums=('4ba53c7c1cb39279aae5f8d7d22054c485c71169920e5a36ed098b115e2e3c5d')
sha256sums_x86_64=('7f0d0696d5c3e0a2a5735365f920eadfe8e0fdac9ba3d87e1b46952cf6c18da6')

package() {
  cd "$srcdir/rhun-$pkgver"

  install -Dm755 bin/rhun "$pkgdir/usr/bin/rhun"
  install -d "$pkgdir/usr/share"
  cp -r share/applications share/icons "$pkgdir/usr/share/"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/LICENSE-Iosevka-$pkgver.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-Iosevka.md"
}
