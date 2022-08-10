pkgname=lightdm-webkit2-theme-xinux
_pkgname=lightdm-webkit2-theme-xinux
pkgver=1.1
pkgrel=1
pkgdesc="Xinux Webkit2 greeter theme"
arch=('any')
url=https://github.com/uzinfocom-org/greeter
license=('MIT')
depends=('lightdm' 'lightdm-webkit2-greeter')
optdepends=()
source=("https://github.com/uzinfocom-org/greeter/archive/v${pkgver}.zip")
md5sums=('2a655576ccf0143f1d0dd54e1f0c9ebd')
conflicts=('lightdm-webkit2-theme-xinux-git')

remove () {
    local _list _file
    _list=($(echo "$@"))
    for _file in "${_list[@]}"; do
        if [[ -f "${_file}" ]]; then
            rm -f "${_file}"
        elif [[ -d ${_file} ]]; then
            rm -rf "${_file}"
        fi
    done
}


package () {
    mkdir -p "${pkgdir}/usr/share/lightdm-webkit/themes/xinux"
    mv "${srcdir}/greeter-${pkgver}/"* "${pkgdir}/usr/share/lightdm-webkit/themes/xinux"
}
