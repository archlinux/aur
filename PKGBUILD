# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=kproxyswitch
pkgver=1.03
pkgrel=1
pkgdesc='A simple bash script, which makes setting the proxy server easier in KDE'
arch=('any')
url="http://kde-apps.org/content/show.php?content=34605"
license=('GPL')
depends=('bash' 'kdelibs')
source=("http://patrick-nagel.net/scripts/${pkgname}/${pkgname}.sh")
md5sums=('023990efbaa02ce002b6195e62dee7ce')

package() {
  cd ${srcdir}

  sed -i 's|${HOME}/.kde/|`kde4-config --localprefix`|' kproxyswitch.sh

  install -Dm755 kproxyswitch.sh ${pkgdir}/usr/bin/kproxyswitch
}
