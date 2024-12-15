# Maintainer: Nanaka Hiira <hiira plus archlinux at hiira dot dev>

pkgname='concrnt-webui-bin'
pkgdesc='Concrnt registration page and admin panel'
pkgver=1.6.0
_pkgver=v${pkgver}
pkgrel=1
arch=('any')
url="https://github.com/totegamma/concurrent"
license=('MIT')
depends=('concrnt-gateway' 'concrnt-api')

provides=('concrnt-webui')
conflicts=('concrnt-webui')

source=("ccweb-${pkgver}::https://github.com/totegamma/concurrent/releases/download/${_pkgver}/web.zip"
        # v1.6.0 release tarball does not yet contain LICENSE file
        "https://raw.githubusercontent.com/totegamma/concurrent/refs/heads/develop/LICENSE")

sha512sums=('ea478f9011f44c8e92554bc50389cc7de9fcb0e464d5cbb4882215a2f43c438ce964a3c024a25490e2a375bfd0671d132c96c42a432dceb96d80d1a841af592e'
            '6991f0cdffef328c29368d987a46e2d12d765b743cad04ae4c89469e1644f11f079fb495e5297b79d521f88b40d6fb3c5b972279c95f394bdb07cf4a2037f412')

package() {
  mkdir -p ${pkgdir}/var/lib/concrnt
  cp -dpTr --no-preserve=ownership "${srcdir}/dist" "${pkgdir}/var/lib/concrnt/web"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
