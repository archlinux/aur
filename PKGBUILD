# Maintainer: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# Configure: Patrick Palka <patrick@parcs.ath.cx>
# vim:set ts=2 sw=2 et ft=sh tw=100: expandtab


pkgname=symfony
pkgver=1.4.20
pkgrel=2
pkgdesc="A web-application framework for PHP projects"
arch=('any')
url="http://symfony-project.org/"
license=('MIT')
depends=(php)
optdepends=('php-xsl: for compatibility with Propel')
source=(
$pkgname-$pkgver.tgz::http://pear.symfony-project.com/get/$pkgname-$pkgver.tgz
$pkgname.bash::https://raw.github.com/wyrfel/Symfony-Bash-Completion-Script/master/etc/bash_completion.d/symfony
)

install=$pkgname.install
options=(!emptydirs !strip)
package() {
    cd "$srcdir"/$pkgname-$pkgver

    install -d "$pkgdir"/usr/share
    cp -R . "$pkgdir"/usr/share/$pkgname

    install -d "$pkgdir"/usr/bin
    ln -s /usr/share/$pkgname/data/bin/$pkgname "$pkgdir"/usr/bin/

    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
    install -Dm644 ../$pkgname.bash "$pkgdir"/etc/bash_completion.d/$pkgname
}
md5sums=('474dd85b665c64ddc08f320e35546b84'
         '2772cb1b65cc83a90e25122dbc526078')
