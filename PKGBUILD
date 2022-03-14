# Maintainer: Connor Etherington <nu1l@null.net>
# ---
pkgname=bettervim
pkgver=1.0.r7
pkgrel=1
pkgdesc="Configuration's aimed at enhancing user experience in the neoVim text editor."
arch=(x86_64)
url="https://gitlab.com/qYp/${pkgname}"
license=('MIT')
depends=(neovim python-pynvim neovim-plug)
source=(
  "https://gitlab.com/qYp/concise/-/raw/master/x86_64/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.zst"
  "https://gitlab.com/qYp/concise/-/raw/master/x86_64/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.zst.sig"
  )
sha256sums=(
  '063f97c12d15b687d9353cde065840bafdf7396a9c0f8031e452d1584901d2f5'
  '813605c142555d4b459a9fb13e7ca26e864a6d3817f269dff2b87beb21871ff9'
  )

package() {
  install -Dm644 usr/share/${pkgname}/colors/concise.vim "${pkgdir}/usr/share/${pkgname}/colors/concise.vim"
  install -Dm644 usr/share/${pkgname}/autoload/plug.vim "${pkgname}/usr/share/${pkgname}/autoload/plug.vim"
  install -Dm644 usr/share/${pkgname}/{init.vim,highlight.css} -t "${pkgdir}/usr/share/${pkgname}"
  install -Dm644 usr/share/${pkgname}/autoload/plug.vim -t "${pkgdir}/usr/share/${pkgname}/autoload"
  install -Dm644 usr/share/licenses/${pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
