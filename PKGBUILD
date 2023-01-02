# Maintainer: Twann <tw4nn [at] disroot [dot] org>

_pkgname=forgejo
pkgname=forgejo-openrc
pkgver=20230201
pkgrel=1
pkgdesc="OpenRC Forgejo init script"
arch=("any")
url="https://forgejo.org"
# This package is based on the one from: https://gitea.artixlinux.org/packagesG/gitea-openrc, which is released under GPLv2 license.
# Forgejo itself is released under MIT license.
license=("GPL2")
backup=("etc/conf.d/forgejo")
depends=(
    "openrc"
    "forgejo"
)
source=(
    "forgejo.confd"
    "forgejo.initd"
)
sha512sums=(
    "a9367570a53b878f0fb9df39b5463ed6e24124e2b30a27a0d53ad76a8b03d0dbc4531ff07629bdd28cf4fcceb33c26b8efc2a30732b88f91ddc657b5df0c901c"
    "a42ec9e2a4aed85d0b1051e6ba14459b73a36b774af681ce607564a49c1b0616beec6e7da414f9227befd3b3cae4c8fce242978637019d62007195fc5d8446df"
)

package() {
  install -Dm0644 "${srcdir}/${_pkgname}.confd" "${pkgdir}/etc/conf.d/${_pkgname}"
  install -Dm0755 "${srcdir}/${_pkgname}.initd" "${pkgdir}/etc/init.d/${_pkgname}"
}
