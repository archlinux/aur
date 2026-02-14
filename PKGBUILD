# Maintainer: Razykov Vyacheslav <v.razykov@gmail.com>
# Contributor: Marat Moustafine <moustafine-@t-tuta-d.t-io>

pkgname=pvs-studio
pkgver=7.41.103095.730
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
sha256sums=('b94bc3f5b74fa626cd672c4144cfb3b25732dd189ace941a95595711dc273cbf')

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
