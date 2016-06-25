# Maintainer: Christopher Loen <christopherloen at gmail dot com>

_gemname_='syslog-logger'
pkgname="ruby-${_gemname_}"
pkgver='1.6.8'
pkgrel=1
pkgdesc='An improved Logger replacement that logs to syslog. It is almost drop-in with a few caveats.'
arch=('any')
url='http://github.com/ngmoco/syslog_logger'
license=('unknown')
depends=('ruby')
options=(!emptydirs)
source=("https://rubygems.org/downloads/${_gemname_}-${pkgver}.gem")
noextract=("${_gemname_}-${pkgver}.gem")
sha256sums=('7541f34681c7d10ed63e8ee82733b0a60f79264a6ef3f489a20dce80e105c293')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" "${_gemname_}-${pkgver}.gem"
  rm "${pkgdir}/${_gemdir}/cache/${_gemname_}-${pkgver}.gem"
}
