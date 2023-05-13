# Maintainer: spyophobia <76800505+spyophobia@users.noreply.github.com>

pkgname=acl4ssr-acl-git
pkgver=r28.3d9a2cd
pkgrel=1
epoch=1
pkgdesc='Ad-removal & GFW-bypass ACL rules for Shadowsocks & SSR (git version)'
arch=('any')
url='https://github.com/ACL4SSR/ACL4SSR'
license=('custom:CCPL-cc-by-sa-4.0')
makedepends=('git')
provides=('acl4ssr-acl')

source=("acl4ssr::git+${url}.git#branch=master")
sha512sums=('SKIP')

pkgver() {
    cd "${srcdir}/acl4ssr"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${srcdir}/acl4ssr"
    install -Dm644 LICENCE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/acl4ssr-acl/README.md"

    cd "${srcdir}/acl4ssr/Acl"
    install -Dm644 -t "${pkgdir}/usr/share/acl4ssr-acl" \
      backcn-banAD.acl banAD.acl easylist-banAD.acl fullgfwlist.acl gfwlist-banAD.acl nobanAD.acl onlybanAD.acl
}
