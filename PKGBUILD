# Maintainer: marmis <tiagodepalves@gmail.com>
# Contributor: "marmis" Tiago de Paula <tiagodepalves@gmail.com>
# Contributor: Pig Fang <g-plane@hotmail.com>
# Contributor: 欠陥電気 <misaka13514@gmail.com>

pkgname=pnpm-shell-completion
pkgdesc='Complete your pnpm command fastly'
pkgver=0.5.5
pkgrel=1
url='https://github.com/g-plane/pnpm-shell-completion'
arch=(x86_64)
license=('MIT')
depends=('glibc' 'libgcc')
options=(!strip !debug)
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/pnpm-shell-completion_${CARCH}-unknown-linux-gnu.tar.gz")
b2sums=('694309194fbe92955bc7ae42ba309cc27b8ca05823d8993e631243fd786e39631918443be0044e5a63e2c1078dde05079b0718b99b43637e30d6a77f9297766b')

package() {
  install -vD -t "${pkgdir}/usr/bin" \
    -m755 pnpm-shell-completion
  install -vD -m644 pnpm-shell-completion.plugin.zsh \
    -T "${pkgdir}/usr/share/zsh/plugins/pnpm-shell-completion/pnpm-shell-completion.zsh"
  install -vD -t "${pkgdir}/usr/share/fish/vendor_completions.d" \
    -m644 pnpm.fish
  install -vD -t "${pkgdir}/usr/share/licenses/${pkgname}" \
    -m644 LICENSE
}
