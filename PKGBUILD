# Maintainer: Drew Ortega <orvyx@protonmail.com>

pkgname=puppet-bolt-git
pkgver=1.48.0.r21.g9064dbe6
pkgrel=1
pkgdesc='Bolt is an orchestration tool that automates remote nodes with SSH or WinRM'
arch=('x86_64')
url='https://github.com/puppetlabs/bolt'
license=('Apache')
makedepends=('ruby' 'git')
source=('git+https://github.com/puppetlabs/bolt')
sha256sums=('SKIP')

conflicts=('puppet-bolt')

build() {
  gem install net-ssh-krb
  cd "bolt"
  gem build  
}

package() {
  cd "bolt"
  gem install --local ./bolt-*.gem
}

pkgver() {
  cd "bolt"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
