# Maintainer: Emanuele Calo <emanuele.lele.calo@gmail.com>
pkgname=riso-bin
pkgver=0.6.1
pkgrel=1
pkgdesc="Modular ricing framework: renders themes into the files a desktop reads (prebuilt binary)"
arch=('x86_64')
url="https://github.com/eldios/riso"
license=('MIT')
# No split debug package: it outlives the main one as an orphan.
options=('!debug')
# git and curl are called at run time to install themes and plugins.
depends=('glibc' 'gcc-libs' 'git' 'curl')
provides=('riso')
conflicts=('riso')
source=("riso-v$pkgver-x86_64-linux.tar.gz::$url/releases/download/v$pkgver/riso-v$pkgver-x86_64-linux.tar.gz"
        "riso-$pkgver.1::https://raw.githubusercontent.com/eldios/riso/v$pkgver/docs/riso.1"
        "LICENSE-$pkgver::https://raw.githubusercontent.com/eldios/riso/v$pkgver/LICENSE"
        "NOTICE-$pkgver::https://raw.githubusercontent.com/eldios/riso/v$pkgver/NOTICE"
        "README-$pkgver.md::https://raw.githubusercontent.com/eldios/riso/v$pkgver/README.md")
sha256sums=('b582a02834dcee073f74ea81e367c013bddf2b34224db9db5b899073fedd3560'
            '06b4210cab507c6f0dbdd4c946272884ccb5ed30e21196dde42860ff61243aba'
            '331b3d7b3a298f2799578f09fafc3563a9d43d59b4771f4ed0cd7fba7a7534db'
            '74f2cb0bc2de3036dc9099d8f45ea855eae4173c311bdcbd0f6a2a162d6cab1c'
            '75029b60d924ec05603d646301c5699d522f7aabd8f637e8c4ec823e8307040f')

package() {
  install -Dm755 riso "$pkgdir/usr/bin/riso"
  install -Dm644 "riso-$pkgver.1" "$pkgdir/usr/share/man/man1/riso.1"
  install -Dm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "NOTICE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/NOTICE"
  install -Dm644 "README-$pkgver.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
