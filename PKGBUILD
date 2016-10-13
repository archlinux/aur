# Maintainer:  Joost Bremmer <toost.b@gmail.com>
# Contributor: Aaron Griffin <aaron@archlinux.org>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=neovim-a
pkgver=2.18
_scriptid=7218
_docid=6347
pkgrel=1
pkgdesc="alternate files in Neovim quickly (.c -> .h etc)"
arch=('any')
url="http://www.vim.org/scripts/script.php?script_id=31"
license=('custom')
depends=('neovim')
groups=('neovim-plugins')
install=nvim-doc.install
source=("a.vim::http://www.vim.org/scripts/download_script.php?src_id=$_scriptid"
        "alternate.txt::http://www.vim.org/scripts/download_script.php?src_id=$_docid"
        "LICENSE")
sha256sums=('4c3de319e3047ffba3384ed59bcfff6fabaf1073b50ee9d3855a03b3a7db42e0'
            'a8fb8daabeee00b7a5c22b65f76dc0758b3e5fcfb95297235ec3ce102bdc4eb3'
            'fa5cd5adcfc6a34910fc9f580b7d9a31b1c7ff958268c24f58fb0e9664c60246')

package() {
  cd ${srcdir}

  installpath="${pkgdir}/usr/share/nvim/runtime/"

  install -D -m644 a.vim $installpath/plugin/a.vim
  install -D -m644 alternate.txt $installpath/doc/alternate.txt
  install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
# vim: sw=2 ts=2 et:
