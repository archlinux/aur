# Maintainer: Emanuele Calo <emanuele.lele.calo@gmail.com>
pkgname=riso-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="Modular ricing framework: renders themes into the files a desktop reads (prebuilt binary)"
arch=('x86_64')
url="https://github.com/eldios/riso"
license=('MIT')
# git and curl are called at run time to install themes and plugins.
depends=('glibc' 'gcc-libs' 'git' 'curl')
provides=('riso')
conflicts=('riso')
source=("riso-v$pkgver-x86_64-linux.tar.gz::$url/releases/download/v$pkgver/riso-v$pkgver-x86_64-linux.tar.gz"
        "riso-$pkgver.1::https://raw.githubusercontent.com/eldios/riso/v$pkgver/docs/riso.1"
        "LICENSE-$pkgver::https://raw.githubusercontent.com/eldios/riso/v$pkgver/LICENSE"
        "NOTICE-$pkgver::https://raw.githubusercontent.com/eldios/riso/v$pkgver/NOTICE"
        "README-$pkgver.md::https://raw.githubusercontent.com/eldios/riso/v$pkgver/README.md")
sha256sums=('ca5092ff07d40d08be948ee85ad39eea3f263656269cfb1f1f61f5a936865a68'
            '94ed5e1c164aec6cb0b8ba0a6e750b816dc3d9fb4a8c8903b23dd64cb5b5dc53'
            '331b3d7b3a298f2799578f09fafc3563a9d43d59b4771f4ed0cd7fba7a7534db'
            '74f2cb0bc2de3036dc9099d8f45ea855eae4173c311bdcbd0f6a2a162d6cab1c'
            '2e432fbbdaec441eaf059e68be9c9db16b823b4ef3a11dd5649ebbc42350da5b')

package() {
  install -Dm755 riso "$pkgdir/usr/bin/riso"
  install -Dm644 "riso-$pkgver.1" "$pkgdir/usr/share/man/man1/riso.1"
  install -Dm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "NOTICE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/NOTICE"
  install -Dm644 "README-$pkgver.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
