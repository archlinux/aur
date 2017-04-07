# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=mastodon-git
pkgver=1.1_0_g4e41cd9a
_branch=master
pkgrel=0.1
pkgdesc="A GNU Social-compatible microblogging server"
arch=('i686' 'x86_64')
url="https://mastodon.social"
license=('AGPL-3.0')
conflicts=("${pkgname%-git}", "${pkgname%-git}-docker", "${pkgname%-git}-docker-git")
makedepends=(
    'yarn'
    )
depends=(
    'imagemagick'
    'ffmpeg'
    'libpqxx'
    'libxml2'
    'libxslt'
    'nodejs'
    'redis'
    'postgresql'
    )
source=("git://github.com/tootsuite/${pkgname%-git}.git#branch=$_branch")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/-/_/g'
}

