# Maintainer: Nathanael Bonfim <dev@nathabonfim59.com>
pkgname=gitid-bin
pkgver=1.2.0
pkgrel=1
pkgdesc="Git Identity Manager - A tool to manage multiple git identities (pre-compiled binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/nathabonfim59/gitid"
license=('MIT')
optdepends=('git: required for git identity management')
provides=('gitid')
conflicts=('gitid')
options=('!strip' '!debug')

source_x86_64=("gitid-$pkgver-x86_64::https://github.com/nathabonfim59/gitid/releases/download/v$pkgver/gitid_linux_amd64"
              "README.md::https://raw.githubusercontent.com/nathabonfim59/gitid/v$pkgver/README.md"
              "LICENSE::https://raw.githubusercontent.com/nathabonfim59/gitid/v$pkgver/LICENSE")
source_aarch64=("gitid-$pkgver-aarch64::https://github.com/nathabonfim59/gitid/releases/download/v$pkgver/gitid_linux_arm64"
               "README.md::https://raw.githubusercontent.com/nathabonfim59/gitid/v$pkgver/README.md"
               "LICENSE::https://raw.githubusercontent.com/nathabonfim59/gitid/v$pkgver/LICENSE")

sha256sums_x86_64=('0d75ffac6183ee4552645455893b36c1c471284127623392010f585e534c07df'
                  'eae62a667582c8672081204389520e816dcfdcf5091401863639fdf7efc16675'
                  'd6a171f63921cf23aa69a447ffe858cffca49cf0d63d1b3423d81a4ccc56e272')
sha256sums_aarch64=('e278a267b740e590221cd805b285c68e8ce5f37c81dd2c7b95ca1f509c98f29c'
                    'eae62a667582c8672081204389520e816dcfdcf5091401863639fdf7efc16675'
                    'd6a171f63921cf23aa69a447ffe858cffca49cf0d63d1b3423d81a4ccc56e272')

package() {
  install -Dm755 "gitid-$pkgver-$CARCH" "$pkgdir/usr/bin/gitid"
  
  # Install documentation
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}