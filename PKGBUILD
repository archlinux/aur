# Maintainer: Razykov Vyacheslav <v.razykov@gmail.com>
# Contributor: Marat Moustafine <moustafine-@t-tuta-d.t-io>

pkgname=pvs-studio
pkgver=7.41.103683.741
pkgrel=1
pkgdesc='Static code analyzer for C and C++'
arch=('x86_64')
url=http://www.${pkgname}.com/en/${pkgname}
license=('custom:pvs-studio')
optdepends=('how-to-use-pvs-studio-free: for adding special comments to a source code'
            'bash-completion: for bash completion'
            'strace: for analyzing via using strace logs')
conflicts=("$pkgname-bin")
options=('!strip' '!debug')
_name=${pkgname}-${pkgver}-x86_64
source=(${_name}.tgz::https://files.${pkgname}.com/${_name}.tgz)
sha256sums=('ac8bf4a5a90f1ad27698667573dc9247b75aa82edc1c7d097bead51609baecae')

package() {
  # PVS-Studio
  install -Dm755 -t ${pkgdir}/usr/bin \
    ${_name}/bin/${pkgname} \
    ${_name}/bin/${pkgname}-analyzer \
    ${_name}/bin/plog-converter

  # Bash completion
  install -Dm644 ${_name}/etc/bash_completion.d/${pkgname}.sh \
                 ${pkgdir}/etc/bash_completion.d/${pkgname}.sh

  # License
  install -Dm644 ${_name}/share/doc/${pkgname}/License.txt \
                "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
