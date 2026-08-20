# Maintainer: Emanuele Calo <emanuele.lele.calo@gmail.com>
pkgname=riso-bin
pkgver=0.3.4
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
sha256sums=('5384b476e3fc686928a0b4de05eeff7290fe280077dc66ef47aedf240eedeea0'
            'ba64280f29e59ff1e9c05c25b475be7e472bb85b98cb0926904ad1f262b29c6e'
            '331b3d7b3a298f2799578f09fafc3563a9d43d59b4771f4ed0cd7fba7a7534db'
            '74f2cb0bc2de3036dc9099d8f45ea855eae4173c311bdcbd0f6a2a162d6cab1c'
            '4318acc4b50463e07bf288c7e4ef66a9c78978e9d131d783fd111018de757c30')

package() {
  install -Dm755 riso "$pkgdir/usr/bin/riso"
  install -Dm644 "riso-$pkgver.1" "$pkgdir/usr/share/man/man1/riso.1"
  install -Dm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "NOTICE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/NOTICE"
  install -Dm644 "README-$pkgver.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
