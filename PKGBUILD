# Maintainer:  Edgar Vincent <e-v@posteo.net>
_pkgname=messenger-notify
pkgname=${_pkgname}-bin
pkgrel=1
pkgver=0.2.0
pkgdesc="A background service that can be connected to messengers (such as Signal and Matrix) and will show a desktop notification on message receive. Binary version."
arch=('x86_64' 'aarch64')
url="https://gitlab.com/Schmiddiii/$_pkgname"
license=('AGPL3')
depends=('gcc-libs'
         'openssl')
optdepends=('waked: for scheduled wake-ups'
           'feedbackd: for vibrating notifications')
provides=("$_pkgname")
conflicts=("${_pkgname}-git")
source=("https://gitlab.com/Schmiddiii/$_pkgname/-/archive/${pkgver}/$_pkgname-${pkgver}.tar.gz")
source_x86_64=("https://patchouli.sr.ht/builds.sr.ht/artifacts/~e-v/839447/0b13cff6ba803567/${_pkgname}_x86_64"
               "https://patchouli.sr.ht/builds.sr.ht/artifacts/~e-v/839447/0b13cff6ba803567/${_pkgname}_x86_64.asc")
source_aarch64=("https://patchouli.sr.ht/builds.sr.ht/artifacts/~e-v/839446/e05e22832419b46c/${_pkgname}_aarch64"
                "https://patchouli.sr.ht/builds.sr.ht/artifacts/~e-v/839446/e05e22832419b46c/${_pkgname}_aarch64.asc")
sha256sums=('82eab6858eecb0bb0eb03ee27c1523bc0ae10727c4d5edb7a710b59fc504ce1f')
sha256sums_x86_64=('796abe3716d58f1bef2d773e91d69c2fdac859be25bfe6451127e4d5104e44f3'
                  'SKIP')
sha256sums_aarch64=('1f224a61c059f93712c33abaa52eb682480e393c4199f38cbd0db9a6f7b19662'
                   'SKIP')
validpgpkeys=('D79DB7519A6EDAA6B2C1CFA05636577A997685EF')

package() {
  install -Dm0755 -T "$srcdir/${_pkgname}_${CARCH}" "$pkgdir/usr/bin/${_pkgname}"
  install -Dm0755 -t "$pkgdir/usr/lib/systemd/user/" "$srcdir/${_pkgname}-${pkgver}/${_pkgname}".service
}

# vim:set ts=2 sw=2 et:
