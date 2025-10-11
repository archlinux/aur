# Maintainer: Jonas Verhofsté <jonas@verhofste.tech>

pgkbase='lavanda-kde-git'
_pkgbase='lavanda-kde'
pkgname=('lavanda-kde-git' 'lavanda-aurorae-theme-git' 'kvantum-theme-lavanda-git' 'lavanda-sea-kde-git' 'lavanda-sea-aurorae-theme-git' 'kvantum-theme-lavanda-sea-git')
pkgver='r26.85018ee'
pkgrel=1
pkgdesc="Lavanda KDE plasma theme"
url="https://github.com/vinceliuice/Lavanda-kde"
arch=('any')
license=('GPL-3.0')
source=("${_pkgbase}::git+${url}.git")
sha256sums=('SKIP')
options=('!strip' '!debug')

_colour_variants=('Light' 'Dark')

pkgver() {
  cd "${_pkgbase}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package_lavanda-kde-git() {
  cd "${srcdir}/${_pkgbase}"

  install -d -m '0755' "${pkgdir}/usr/share/color-schemes"
  install -d -m '0755' "${pkgdir}/usr/share/plasma/desktoptheme"
  install -d -m '0755' "${pkgdir}/usr/share/plasma/look-and-feel"
  install -d -m '0755' "${pkgdir}/usr/share/wallpapers"

  for colour in "${_colour_variants[@]}"; do
    install -D -m '0644' -t "${pkgdir}/usr/share/color-schemes" "color-schemes/Lavanda${colour}.colors"

    cp -r -L "plasma/desktoptheme/Lavanda-${colour}" "${pkgdir}/usr/share/plasma/desktoptheme/"
    install -D -m '0644' -t "${pkgdir}/usr/share/plasma/desktoptheme/Lavanda${colour}/icons" 'plasma/desktoptheme/icons'/*
    install -D -m '0644' -T "color-schemes/Lavanda${colour}.colors" "${pkgdir}/usr/share/plasma/desktoptheme/Lavanda${colour}/colors"

    cp -r -L "plasma/look-and-feel/com.github.vinceliuice.Lavanda-${colour}" "${pkgdir}/usr/share/plasma/look-and-feel/"

    cp -r -L "wallpaper/Lavanda-${colour}" "${pkgdir}/usr/share/wallpapers"
  done

  cp -r -L "wallpaper/Lavanda" "${pkgdir}/usr/share/wallpapers"
}

package_lavanda-aurorae-theme-git() {
  pkgdesc='Lavanda Aurorae theme'

  cd "${srcdir}/${_pkgbase}"

  install -d -m '0755' "${pkgdir}/usr/share/aurorae"
  for colour in "${_colour_variants[@]}"; do
    install -D -m '0644' -t "${pkgdir}/usr/share/aurorae/Lavanda-${colour}" "aurorae/Lavanda-${colour}"/*
  done
}

package_kvantum-theme-lavanda-git() {
  pkgdesc='Lavanda Kvantum theme'

  cd "${srcdir}/${_pkgbase}"

  install -d -m '0755' "${pkgdir}/usr/share/Kvantum/Lavanda"
  install -D -m '0644' -t "${pkgdir}/usr/share/Kvantum/Lavanda" 'Kvantum/Lavanda'/*
}

package_lavanda-sea-kde-git() {
  pkgdesc='Lavanda Sea KDE plasma theme'

  cd "${srcdir}/${_pkgbase}"

  install -d -m '0755' "${pkgdir}/usr/share/color-schemes"
  install -d -m '0755' "${pkgdir}/usr/share/plasma/desktoptheme"
  install -d -m '0755' "${pkgdir}/usr/share/plasma/look-and-feel"
  install -d -m '0755' "${pkgdir}/usr/share/wallpapers"

  for colour in "${_colour_variants[@]}"; do
    install -D -m '0644' -t "${pkgdir}/usr/share/color-schemes" "color-schemes/LavandaSea${colour}.colors"

    cp -r -L "plasma/desktoptheme/Lavanda-Sea-${colour}" "${pkgdir}/usr/share/plasma/desktoptheme/"
    install -D -m '0644' -t "${pkgdir}/usr/share/plasma/desktoptheme/LavandaSea${colour}/icons" 'plasma/desktoptheme/icons'/*
    install -D -m '0644' -T "color-schemes/LavandaSea${colour}.colors" "${pkgdir}/usr/share/plasma/desktoptheme/Lavanda${colour}/colors"

    cp -r -L "plasma/look-and-feel/com.github.vinceliuice.Lavanda-Sea-${colour}" "${pkgdir}/usr/share/plasma/look-and-feel/"

    cp -r -L "wallpaper/Lavanda-Sea-${colour}" "${pkgdir}/usr/share/wallpapers"
  done

  cp -r -L "wallpaper/Lavanda-Sea" "${pkgdir}/usr/share/wallpapers"
}

package_lavanda-sea-aurorae-theme-git() {
  pkgdesc='Lavanda Sea Aurorae theme'

  cd "${srcdir}/${_pkgbase}"

  install -d -m '0755' "${pkgdir}/usr/share/aurorae"
  for colour in "${_colour_variants[@]}"; do
    install -D -m '0644' -t "${pkgdir}/usr/share/aurorae/Lavanda-Sea-${colour}" "aurorae/Lavanda-Sea-${colour}"/*
  done
}

package_kvantum-theme-lavanda-sea-git() {
  pkgdesc='Lavanda Sea Kvantum theme'

  cd "${srcdir}/${_pkgbase}"

  install -d -m '0755' "${pkgdir}/usr/share/Kvantum/LavandaSea"
  install -D -m '0644' -t "${pkgdir}/usr/share/Kvantum/LavandaSea" 'Kvantum/LavandaSea'/*
}
