# Maintainer: Connor Etherington <connor@concise.cc>
# ---
pkgname=ez
pkgver=1.1.1
pkgrel=1
pkgdesc='Task simplificaltion scripts that increase speed and efficiency in common tasks'
arch=('any')
url="https://gitlab.com/a4to/${pkgname}"
license=('MIT')
depends=()
optdepends=(
  "git: To use ezgc for cloning repositories"
  "npm: To download npm packages with ezdl"
  "snapd: To install snap packages with ezdl"
  "python-pip: To install python packages with ezdl"
  "lf: To integrate the lf file manager with eztst"
  )
provides=(ez ezdl ezgc eztst ezssl)
source=("https://gitlab.com/a4to/concise/-/raw/master/x86_64/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.zst")
sha256sums=('8cadc5057dfd314f8e9138f8e6b754174e9e6f9842fb2dcce38a9c1c9d0a3529')

package() {
  install -Dm775 usr/bin/* -t "${pkgdir}/usr/bin/"
  install -Dm644 usr/share/licenses/${pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  for x in ezdl ezgc eztst ezssl; do
    install -Dm644 usr/share/doc/${pkgname}/${x}/README "${pkgdir}/usr/share/doc/${pkgname}/${x}/README"
  done ; }
