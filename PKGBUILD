# Maintainer: Felix Barz <skycoder42.de@gmx.de>
pkgname=paccache-hook
pkgver=1.2.0
pkgrel=1
pkgdesc="A configurable hook to cleanup the pacman package cache using paccache"
arch=('any')
license=('BSD')
depends=('pacman-contrib')
conflicts=('pacman-cleanup-hook')
source=("$pkgname.conf"
        "$pkgname.sh"
        "$pkgname.hook"
        "LICENSE")
b2sums=('f354ac90a0236a3f00c478f16eda56ab73baedaf235e35848fc50592be9328b123bbfab946ab90b45948ec06eb2d881c119cec575c19a947fe8f64c6cac6e552'
        'e966bdb95142e7d2d09ee8b653219d889306965c6d19b2a86f91c9dc51c09f726a8f68251c9137ba124b39576fa54af56989958991a3b8e2fc12c6ded33da511'
        'ebc6394bd960fd6f2bb26593be20461adf8e251124787e98664343426c9cdec04bfff7677aba0e78d6f43b885f40e415243b683473eaecd082e5f3ef83cc53ab'
        '9ec9da9d10bb6bc940a83bb087d04154e41920fe78723d3e746e632a04c50c40bb5bbc807b955f8b81b78a225297c099f7b4077881f8c506b13285a41b65a552')
backup=("etc/$pkgname.conf")

package() {
  install -D -m644 "${srcdir}/$pkgname.hook" "${pkgdir}/usr/share/libalpm/hooks/$pkgname.hook"
  install -D -m755 "${srcdir}/$pkgname.sh" "${pkgdir}/usr/share/libalpm/scripts/$pkgname.sh"
  install -D -m644 "${srcdir}/$pkgname.conf" "${pkgdir}/etc/$pkgname.conf"
  install -D -m644 "${srcdir}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
