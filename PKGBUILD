# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: olantwin <olantwin@gmail.com>

pkgname=vim-airline
pkgver=0.11
pkgrel=1
pkgdesc='Status line, written in Vimscript'
url='https://github.com/vim-airline/vim-airline'
arch=('any')
license=('MIT')
depends=('vim' 'vim-airline-themes')
makedepends=('git')
groups=('vim-plugins')
optdepends=('powerline-fonts')
source=(${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('7837f9ae02c1503c7eb6918776292ac6e4b03535eb95aaf20ee091264af5e62c12b471a6e243db80891114848e71f75d9d1022df68909dd4940c88f093e3deb8')
b2sums=('7cb5cd6afbe1d30c664c6f2de75553972792806e4c75a9a178b497e92f3545e686111af08bb0b0b47e196a8ee04771947101bfe4d0d070023300f9479983f6ec')

package() {
  cd ${pkgname}-${pkgver}

  _installpath="$pkgdir/usr/share/vim/vimfiles"
  install -d "${_installpath}"
  cp -r -t "${_installpath}" autoload doc plugin t
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 README.md CHANGELOG.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: ts=2 sw=2 et:
