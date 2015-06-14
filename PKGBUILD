# Maintainer: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# Contributor: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# vim:set ts=2 sw=2 et ft=sh tw=100: expandtab

pkgname=nginx-site
pkgver=0.1
pkgrel=2
pkgdesc='Enable/disable sites on nginx'
arch=('any')
url='https://aur.archlinux.org/packages/nginx-site/'
license=('GPL')
groups=()
depends=(bash)
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=(
etc/conf.d/nginx-site.conf
)
options=(!strip)
install=
source=(
nginx-site 
nginx-site.conf 
bash_completion)
noextract=()
install='nginx-site.install'

package(){
  cd "$srcdir"
  install -Dm755 $pkgname "$pkgdir"/usr/bin/nginx-ensite
  install -Dm644 ${pkgname}.conf "$pkgdir"/etc/conf.d/${pkgname}.conf
  ln -s nginx-ensite "$pkgdir"/usr/bin/nginx-dissite
  install -Dm644 bash_completion "$pkgdir"/etc/bash_completion.d/nginx-site
}
md5sums=('c365c41b600ba4d09889f2439d0823ec'
         'e5ac33d2c5132a3d454354795859f111'
         '51f4b595e0b47a6ce89912c2c5977c7e')
