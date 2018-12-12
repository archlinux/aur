# Maintainer: Cezar Mathe <cezarmathe@gmail.com>
pkgname=repotools
pkgver=0.1
pkgrel=1
pkgdesc="Utility for creating and maintaining custom user repositories."
arch=(x86_64)
url="https://github.com/cezarmathe/repotools"
license=('MIT')
depends=('git' 'aurutils')
backup=('etc/repotools.conf')
source=("repotools"
        "repotools.conf"
        "add_remove_packages.sh" 
        "build_environment.sh" 
        "build_packages.sh" 
        "cycle.sh" 
        "help_usage.sh" 
        "new_meta_package.sh" 
        "new_repository.sh" 
        "pacman_entries.sh" 
        "sync_repositories.sh" 
        "update_repositories.sh" 
        "utils.sh"
        "LICENSE")
md5sums=('7421f50cf89be766e910b9fcbb36c235'
         'deb5ca2e557abab23905145c625f06a1'
         'a0b7d63a8aa5cde42c21f11b182180b3'
         '846d10842ef7c63a6e493104cbf4a61c'
         '70aea403ce23dc0c83c203cf24036896'
         'eb33d6e5471a83e52af3d7df9d4d51a9'
         '3ae35c3be45b14387650a5d68286696f'
         'e643ddd60ba72ad53e53d45eac76250d'
         '879df82b7fe4ec27f2aa45d2c4715ac4'
         '5e480eb9052bd62328142e26617721f7'
         '638355180cca826d3f14d74be7cce9d0'
         'df83bedfaf82a7b89aec6535bc490093'
         'b9bbf84850ea005568429d396e449f56'
         '1269890d8780c9cbf0aef3d1eb01bbb5')
validpgpkeys=('61C1AF95BB594AD40DEEB7103F8F89E56422CBA8')

package() {
	
  install -Dm755 "${srcdir}/repotools" "${pkgdir}/usr/bin/repotools"
  
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  script_files=("add_remove_packages.sh" 
                "build_environment.sh" 
                "build_packages.sh" 
                "cycle.sh" 
                "help_usage.sh" 
                "new_meta_package.sh" 
                "new_repository.sh" 
                "pacman_entries.sh" 
                "sync_repositories.sh" 
                "update_repositories.sh" 
                "utils.sh")

  for script_file in ${script_files[*]}
  do
    install -Dm 644 "${srcdir}/${script_file}" "${pkgdir}/usr/lib/${pkgname}/${script_file}"
  done

  install -Dm644 "${srcdir}/repotools.conf" "${pkgdir}/etc/${pkgname}.conf"
}
