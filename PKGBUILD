# Maintainer: Yakov Till <yakov.till@gmail.com>
pkgname=codedb-bin
pkgver=0.2.5850
pkgrel=1
pkgdesc='Code intelligence MCP server - tree-sitter indexing, symbol search, and full-text trigram search'
arch=('x86_64')
url='https://github.com/justrach/codedb'
license=('BSD-3-Clause')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
source=("${pkgname%-bin}-${pkgver}::https://github.com/justrach/codedb/releases/download/v${pkgver}/codedb-linux-x86_64"
        "LICENSE-${pkgver}::https://raw.githubusercontent.com/justrach/codedb/v${pkgver}/LICENSE")
sha256sums=('d5a2239ad613537ad33b7bac591f1614290f7bea406c81920d2e882b8cb699a8'
            '5f4f3b4d4698acb3e86a31812a18391146e667a3afd682de4494a8f0e55bd83b')

package() {
    install -Dm755 "${pkgname%-bin}-${pkgver}" "${pkgdir}/usr/bin/codedb"
    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

latestver() {
    gh api repos/justrach/codedb/releases/latest --jq '.tag_name' | sed 's/^v//'
}
