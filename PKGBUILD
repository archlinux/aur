# Maintainer: Chris Severance aur.severach AatT spamgourmet.com

set -u
pkgname='git-aurcheck'
pkgver='0.62'
pkgrel='1'
pkgdesc='a helper like namcap that checks and offers solutions for common problems in git submissions to the AUR'
arch=('any')
license=('GPL')
depends=('bash' 'pkgbuild-introspection' 'git' 'pcre2')
source=("https://raw.githubusercontent.com/severach/ArchLinuxScripts/master/${pkgname}.sh")
sha256sums=('46f215bddddc1d0fa16621b7b16ab5f5e263294987702dcecc0ebd9b205a6a0e')

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
set +u
