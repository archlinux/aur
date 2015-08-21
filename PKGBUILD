# Maintainer: Chris Severance aur.severach AatT spamgourmet.com

pkgname='git-aurcheck'
pkgver=0.3
pkgrel=1
pkgdesc='a helper like namcap that checks and offers solutions for common problems in git submissions to the AUR'
arch=('any')
license=('GPL')
depends=('bash' 'pkgbuild-introspection' 'git' 'pcre2')
source=("${pkgname}.sh")
sha256sums=('62ea69b8f33f670e0c4d6477765632a475bbe8d89135589402faf324635f1901')

#install='installfoo'; source+=("${install}") # generate errors for us to detect
#changelog='changefoo'; source+=("${changelog}")

pkgver() {
  set -u
  sed -ne "s:^_opt_VERSION='\([^']\+\)'"'$:\1:p' "${pkgname}.sh"
  set +u
}

package() {
  set -u
  install -Dpm755 "${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
  set +u
}
