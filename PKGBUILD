# Maintainer: LY <ly-niko@qq.com>

_pkgname=TodoSync
_prefixed_pkgname=SjtuTodoSync
pkgname=sjtu-todo-sync-bin
pkgver=1.02
pkgrel=1
pkgdesc=""
arch=('x86_64')
url="https://github.com/1357310795/TodoSync"
license=('GPL-3.0-or-later')

source_x86_64=("${pkgname}.Local-Linux.zip::${url}/releases/download/v${pkgver}/${_pkgname}.Local-Linux.zip")

sha256sums_x86_64=('d17d70ab299996b8f54fe3313b54b97fa63ab591e0a710a890a3dd84e5b5ff9c')

package() {
  install -d "${pkgdir}/opt/${_prefixed_pkgname}"
  cp -r --no-target-directory "${srcdir}/net6.0" "${pkgdir}/opt/${_prefixed_pkgname}"
  install -d "${pkgdir}/usr/bin/"
  chmod a+x "${pkgdir}/opt/${_prefixed_pkgname}/TodoSynchronizer.CLI"
  ln -s "${pkgdir}/opt/${_prefixed_pkgname}/TodoSynchronizer.CLI" "${pkgdir}/usr/bin/${_prefixed_pkgname}"
}
