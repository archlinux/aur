# Maintainer: Klaus Alexander Seistrup <klaus@seistrup.dk>
# Contributor: Sebastian Wiesner <sebastian@swsnr.de>
# Contributor: Vlad Petrov <ejiek@mail.ru>

pkgname=nb
pkgver=7.8.0
pkgrel=1
pkgdesc="A command line note-taking, bookmarking, archiving, and knowledge base application"
arch=('any')
url="https://github.com/xwmx/${pkgname}"
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
license=('AGPL3')
depends=('bash' 'git')
optdepends=(
  # Recommended
  'bat: recommended'
  'nmap: for ncat, recommended' # For ncat
  'pandoc: recommended'
  'ripgrep: recommended'
  'tig: recommended'
  'w3m: recommended'
  # Additional
  'ack'
  'the_silver_searcher'
  'catimg'
  'exa'
  'ffmpeg' # For ffplay
  'imagemagick'
  'gnupg'
  'highlight'
  'links'
  'lynx'
  'mc'
  'mpg123'
  'mplayer'
  'poppler' # For pdftotext
  'python-pygments'
  'ranger'
  'readability-cli'
  'ripgrep-all'
  'termpdf.py-git'
  'vifm'
)

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/${pkgname}/README.md"
  # Completions
  install -Dm644 etc/nb-completion.bash "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
  install -Dm644 etc/nb-completion.fish "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}.fish"
  install -Dm644 etc/nb-completion.zsh "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}"
  # Plugins
  install -Dm644 -t "${pkgdir}/usr/share/nb/plugins/" plugins/*
  # Extras (prefixed with "nb-")
  for extra in bookmark notes; do
    install -Dm0755 "bin/$extra" "${pkgdir}/usr/bin/${pkgname}-${extra}"
  done
}

sha256sums=(
  '2cd7df83c6f24625b2ee671ed0f1e2caf9adc297231d851ce6da4cc6909247c6'
)
b2sums=(
  'f2980c0809f57bf993eef18aaab73a6bdfeb34e12a66db3c56bd57454c4e7c4e217a768fd443e6362dcc7c003d374cb99eb0bb3374368fdf51962e69da411560'
)

# 🪷 Beyond the Known — 365 Days of Exploration
#
# 📆 11th November
#
# Oneness? Wholeness? Liberation?
#
# These words are not important.
#
# 🔗 https://magnetic-ink.dk/users/btk

# eof
