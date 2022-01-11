# Maintainer: TunkShif <tunkshif@foxmail.com>
pkgname=rescript-ls
pkgver=1.1.3
pkgrel=1
pkgdesc="Rescript Language Server"
arch=('any')
url="https://github.com/rescript-lang/rescript-vscode"
license=('MIT')
depends=('nodejs')
source=("https://github.com/rescript-lang/rescript-vscode/releases/download/${pkgver}/rescript-vscode-${pkgver}.vsix")
md5sums=('6392d692d91d66d9ae22db654b2ab9d2')

package() {
  unzip -o rescript-vscode-${pkgver}.vsix
  mkdir -p "${pkgdir}/usr/share/rescript-ls"
  cp -R "${srcdir}/extension/server" "${pkgdir}/usr/share/rescript-ls/"
  echo -e '#!/usr/bin/env bash\nnode /usr/share/rescript-ls/server/out/server.js $@' > rescript-ls
  install -Dm 755 rescript-ls "${pkgdir}/usr/bin/rescript-ls"
}
