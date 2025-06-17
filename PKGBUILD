# Maintainer: Daniele Basso <d dot bass05 at proton dot me>
# PKGBUILD_native_modules is broken
pkgname=code-electron-latest
pkgver=1.101.0
pkgrel=1
pkgdesc='Run Code - OSS on latest stable Electron (no native modules)'
arch=("any")
url=https://github.com/microsoft/vscode
license=('MIT')
depends=(code electron)
source=('https://gitlab.archlinux.org/archlinux/packaging/packages/code/-/raw/main/code.sh'
PKGBUILD_native_modules)
sha256sums=('5da1525b5fe804b9192c05e1cbf8d751d852e3717fb2787c7ffe98fd5d93e8c1'
            'd249045a01c3e89cc0c7c1cf7353ac1a54e9d5be507d47d6a8d6f909486506d8')

package() {
  install -Dvm755 code.sh "${pkgdir}"/usr/bin/$pkgname
  echo -e "#compdef ${pkgname}=code\n_$pkgname" | install -Dvm644 /dev/stdin "${pkgdir}"/usr/share/zsh/site-functions/_$pkgname
  # todo: alias bash completion
  # todo: sed desktop entries
}
